import { Client, IMessage } from '@stomp/stompjs'
import SockJS from 'sockjs-client'
import { useEffect, useRef, useState } from 'react'
import { WebSocketMessage } from '../types'

export const useWebSocket = () => {
    const clientRef = useRef<Client | null>(null)
    const [isConnected, setIsConnected] = useState(false)
    const subscriptions = useRef<Map<string, () => void>>(new Map())

    useEffect(() => {
        const socket = new SockJS('http://localhost:8080/ws')
        const stompClient = new Client({
            webSocketFactory: () => socket,
            reconnectDelay: 5000,
            heartbeatIncoming: 4000,
            heartbeatOutgoing: 4000,
            debug: (msg) => console.log('[STOMP]', msg),
            onConnect: () => {
                console.log('[WebSocket] ✅ Connected')
                setIsConnected(true)
            },
            onDisconnect: () => {
                console.log('[WebSocket] 🔌 Disconnected')
                setIsConnected(false)
            },
            onStompError: (frame) => {
                console.error('[WebSocket] ❌ STOMP Error:', frame)
            },
        })

        stompClient.activate()
        clientRef.current = stompClient

        return () => {
            console.log('[WebSocket] 🔌 Cleaning up connections')
            // Unsubscribe all
            subscriptions.current.forEach((unsubscribe) => unsubscribe())
            subscriptions.current.clear()
            // Deactivate client
            stompClient.deactivate()
        }
    }, [])

    const subscribe = (topic: string, handler: (data: WebSocketMessage) => void) => {
        if (!clientRef.current) {
            console.warn('[WebSocket] ⚠️ Client not initialized')
            return { unsubscribe: () => {} }
        }

        console.log('[WebSocket] 📡 Subscribing to:', topic)

        const subscription = clientRef.current.subscribe(topic, (msg: IMessage) => {
            try {
                const parsed = JSON.parse(msg.body)
                console.log(`[WebSocket] 📨 Received on ${topic}:`, parsed)
                handler(parsed)
            } catch (error) {
                console.warn('[WebSocket] ⚠️ Invalid JSON:', msg.body, error)
            }
        })

        subscriptions.current.set(topic, () => subscription.unsubscribe())
        
        return {
            unsubscribe: () => {
                console.log('[WebSocket] 🔕 Unsubscribing from:', topic)
                subscription.unsubscribe()
                subscriptions.current.delete(topic)
            },
        }
    }

    const sendMessage = (payload: unknown) => {
        if (!clientRef.current || !isConnected) {
            console.warn('[WebSocket] ⚠️ Cannot send message: not connected')
            return
        }

        console.log('[WebSocket] 📤 Sending message:', payload)

        clientRef.current.publish({
            destination: '/app/chat.sendMessage',
            body: JSON.stringify(payload),
        })
    }

    return { isConnected, subscribe, sendMessage }
}