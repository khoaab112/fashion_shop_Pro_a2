import cookie from "./cookie";
import localStorage from "./localStorage";
import jwt from "./jwt";

export default function logoutAdmin() {
    const refreshToken = cookie.getRefreshToken();
    if (refreshToken) {
        const payload = jwt.decodePayloadRefreshToken;

    }

}