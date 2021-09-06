const bcrypt = require('bcryptjs')

const helpers = {};

helpers.encriptarContraseña = async (contraseña) => {
    try {const salt = await bcrypt.genSalt(10); //aca generamos un hash para la pass
    const contraseñaFinal = await bcrypt.hash(contraseña, salt);
    return contraseñaFinal;
    } catch(e){
        console.log(e);
    }
}

helpers.compararContraseñas = async (contraseña, contraseñaGuardada) => {
    try {
        return await bcrypt.compare(contraseña, contraseñaGuardada);
    } catch(e){
        console.log(e);
    }
}

module.exports = helpers;