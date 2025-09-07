import { useState } from 'react'
import AdaptableCard from '@/components/shared/AdaptableCard'
import ConfirmDialog from '@/components/shared/ConfirmDialog'
import DoubleSidedImage from '@/components/shared/DoubleSidedImage'
import { FormItem } from '@/components/ui/Form'
import Dialog from '@/components/ui/Dialog'
import Upload from '@/components/ui/Upload'
import { HiEye, HiTrash } from 'react-icons/hi'
import cloneDeep from 'lodash/cloneDeep'
import { Field, FieldProps, FieldInputProps, FormikProps } from 'formik'
import { apiDeleteImageProduct } from '@/services/SalesService'

type Image = {
    id: string
    name: string
    url: string
}

type FormModel = {
    images: Image[]
    [key: string]: unknown
}

type ImageListProps = {
    type: 'edit' | 'new' | 'view'
    images: Image[]
    onImageDelete: (img: Image) => void
}

type ProductImagesProps = {
    type: 'edit' | 'new' | 'view'
    values: FormModel
}

const ImageList = (props: ImageListProps) => {
    const { type, images, onImageDelete } = props

    const [selectedImg, setSelectedImg] = useState<Image>({} as Image)
    const [viewOpen, setViewOpen] = useState(false)
    const [deleteConfirmationOpen, setDeleteConfirmationOpen] = useState(false)

    const onViewOpen = (img: Image) => {
        setSelectedImg(img)
        setViewOpen(true)
    }

    const onDialogClose = () => {
        setViewOpen(false)
        setTimeout(() => {
            setSelectedImg({} as Image)
        }, 300)
    }

    const onDeleteConfirmation = (img: Image) => {
        setSelectedImg(img)
        setDeleteConfirmationOpen(true)
    }

    const onDeleteConfirmationClose = () => {
        setSelectedImg({} as Image)
        setDeleteConfirmationOpen(false)
    }

    const onDelete = () => {
        onImageDelete?.(selectedImg)
        setDeleteConfirmationOpen(false)
    }
    return (
        <>
            {images.map((img) => (
                <div
                    key={img.id}
                    className="group relative rounded border p-2 flex"
                >
                    <img
                        className="rounded max-h-[140px] max-w-full"
                        src={img.url}
                        alt={img.name}
                    />
                    <div className="absolute inset-2 bg-gray-900/[.7] group-hover:flex hidden text-xl items-center justify-center">
                        <span
                            className="text-gray-100 hover:text-gray-300 cursor-pointer p-1.5"
                            onClick={() => onViewOpen(img)}
                        >
                            <HiEye />
                        </span>
                        {type !== 'view' && (
                            <>
                                <span
                                    className="text-gray-100 hover:text-gray-300 cursor-pointer p-1.5"
                                    onClick={() => onDeleteConfirmation(img)}
                                >
                                    <HiTrash />
                                </span>
                            </>
                        )}
                    </div>
                </div>
            ))}
            <Dialog
                isOpen={viewOpen}
                onClose={onDialogClose}
                onRequestClose={onDialogClose}
            >
                <h5 className="mb-4">{selectedImg.name}</h5>
                <img
                    className="w-full"
                    src={selectedImg.url}
                    alt={selectedImg.name}
                />
            </Dialog>
            <ConfirmDialog
                isOpen={deleteConfirmationOpen}
                type="danger"
                title="Remove image"
                confirmButtonColor="red-600"
                onClose={onDeleteConfirmationClose}
                onRequestClose={onDeleteConfirmationClose}
                onCancel={onDeleteConfirmationClose}
                onConfirm={onDelete}
            >
                <p> Are you sure you want to remove this image? </p>
            </ConfirmDialog>
        </>
    )
}

const ProductImages = (props: ProductImagesProps) => {
    const { type, values } = props
    const beforeUpload = (file: FileList | null) => {
        let valid: boolean | string = true

        const allowedFileType = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp']
        const maxFileSize = 5000000

        if (file) {
            for (const f of file) {
                if (!allowedFileType.includes(f.type)) {
                    valid = 'Please upload a valid image file (jpeg, png, jpg, webp)'
                }

                if (f.size >= maxFileSize) {
                    valid = 'Upload image cannot more than 5MB'
                }
            }
        }

        return valid
    }

    const onUpload = (
        form: FormikProps<FormModel>,
        field: FieldInputProps<FormModel>,
        files: File[],
    ) => {
        const newImages = files.map((file, index) => {
            return {
                id: `temp-img-${Date.now()}-${index}`,
                name: file.name,
                url: URL.createObjectURL(file),
                file: file,
            }
        });
        
        const imageList = [...values.images, ...newImages];
        form.setFieldValue(field.name, imageList);
    }

    const handleImageDelete = (
        form: FormikProps<FormModel>,
        field: FieldInputProps<FormModel>,
        deletedImg: Image,
    ) => {
        let imgList = cloneDeep(values.imgList)
        imgList = values.images.filter((img) => img.id !== deletedImg.id)
        form.setFieldValue(field.name, imgList)
        if (!(typeof deletedImg.id === 'string' && deletedImg.id.startsWith('temp-img')) && Number(deletedImg.id) !== 0) {
            apiDeleteImageProduct(Number(deletedImg?.id))
        }
    }

    return (
        <AdaptableCard className="mb-4">
            <h5>Product Image</h5>
            {type !== 'view' ? (
                <p className="mb-6">Add or change image for the product</p>
            ) : (
                <p className="mb-6"></p>
            )}
            <FormItem>
                <Field name="images">
                    {({ field, form }: FieldProps) => {
                        if (values.images.length > 0) {
                            return (
                                <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-2 xl:grid-cols-3 gap-4">
                                    <ImageList
                                        type={type}
                                        images={values.images}
                                        onImageDelete={(img: Image) =>
                                            handleImageDelete(form, field, img)
                                        }
                                    />
                                    {type !== 'view' && (
                                        <Upload
                                            draggable
                                            className="min-h-fit"
                                            beforeUpload={beforeUpload}
                                            showList={false}
                                            multiple={true}
                                            onChange={(files) =>
                                                onUpload(form, field, files)
                                            }
                                        >
                                            <div className="max-w-full flex flex-col px-4 py-2 justify-center items-center">
                                                <DoubleSidedImage
                                                    src="/img/others/upload.png"
                                                    darkModeSrc="/img/others/upload-dark.png"
                                                />
                                                <p className="font-semibold text-center text-gray-800 dark:text-white">
                                                    Upload
                                                </p>
                                            </div>
                                        </Upload>
                                    )}
                                </div>
                            )
                        }

                        return (
                            type !== 'view' && (
                                <Upload
                                    draggable
                                    beforeUpload={beforeUpload}
                                    showList={false}
                                    multiple={true}
                                    onChange={(files) =>
                                        onUpload(form, field, files)
                                    }
                                >
                                    <div className="my-16 text-center">
                                        <DoubleSidedImage
                                            className="mx-auto"
                                            src="/img/others/upload.png"
                                            darkModeSrc="/img/others/upload-dark.png"
                                        />
                                        <p className="font-semibold">
                                            <span className="text-gray-800 dark:text-white">
                                                Drop your image here, or{' '}
                                            </span>
                                            <span className="text-blue-500">
                                                browse
                                            </span>
                                        </p>
                                        <p className="mt-1 opacity-60 dark:text-white">
                                            Support: jpeg, png, jpg, webp
                                        </p>
                                    </div>
                                </Upload>
                            )
                        )
                    }}
                </Field>
            </FormItem>
        </AdaptableCard>
    )
}

export default ProductImages
