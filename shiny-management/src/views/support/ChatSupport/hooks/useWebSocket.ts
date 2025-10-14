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
            onConnect: () => {
                setIsConnected(true)
            },
            onDisconnect: () => {
                setIsConnected(false)
            },
            onStompError: (frame) => {
            },
        })

        stompClient.activate()
        clientRef.current = stompClient

        return () => {
            // Unsubscribe all
            subscriptions.current.forEach((unsubscribe) => unsubscribe())
            subscriptions.current.clear()
            // Deactivate client
            stompClient.deactivate()
        }
    }, [])

    const subscribe = (topic: string, handler: (data: WebSocketMessage) => void) => {
        if (!clientRef.current) {
            return { unsubscribe: () => {} }
        }


        const subscription = clientRef.current.subscribe(topic, (msg: IMessage) => {
                const parsed = JSON.parse(msg.body)
                handler(parsed)
        })

        subscriptions.current.set(topic, () => subscription.unsubscribe())
        
        return {
            unsubscribe: () => {
                subscription.unsubscribe()
                subscriptions.current.delete(topic)
            },
        }
    }

    const sendMessage = (payload: unknown) => {
        if (!clientRef.current || !isConnected) {
            return
        }


        clientRef.current.publish({
            destination: '/app/chat.sendMessage',
            body: JSON.stringify(payload),
        })
    }

    return { isConnected, subscribe, sendMessage }
}