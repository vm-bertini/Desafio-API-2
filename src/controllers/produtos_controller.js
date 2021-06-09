class produtos_controller {
    async hello (req,res) {
        res.status(200).json(req)
    }
}

//olá tudo bem

module.exports = new produtos_controller()