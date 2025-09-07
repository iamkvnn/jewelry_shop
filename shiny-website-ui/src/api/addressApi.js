import axios from "axios";

const axiosAddress = axios.create({
    baseURL: 'https://provinces.open-api.vn/api/v1/',
    headers: {
        'Content-Type': 'application/json',
    },
})

const addressApi = {
    getListProvinces() {
        const url = `/p`;
        return axiosAddress.get(url);
    },
    getProvince(code, params = {}) {
        const url = `/p/${code}`;
        return axiosAddress.get(url, { params });
    },
    getListDistricts() {
        const url = `/d`;
        return axiosAddress.get(url);
    },
    getDistrictDepth2(code) {
        const url = `/d/${code}?depth=2`;
        return axiosAddress.get(url);
    },
    getListWards() {
        const url = `/w`;
        return axiosAddress.get(url);
    },
    getWard(code) {
        const url = `/w/${code}`;
        return axiosAddress.get(url);
    }
    

};

export default addressApi;