// src/middleware/checkPermission.js
import jwt from '@/js/auth/jwt.js';

export default function(to, from, next) {
    const requiredRoles = to.meta.roles;
    if (hasPermission(requiredRoles)) {
        next();
    } else {
        next({ name: 'home' })
    }
}

function hasPermission(requiredRoles) {
    const roleUser = jwt.decodePayloadAccessToken().role;
    if (roleUser === 'SUPERADMIN') return true;
    return requiredRoles.some(role => roleUser.includes(role));
}