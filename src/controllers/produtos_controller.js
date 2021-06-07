class produtos_controller {
    async hello (req,res) {
        res.status(200).json(req)
    }
}

module.exports = new produtos_controller()