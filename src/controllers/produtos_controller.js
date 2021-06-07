class produtos_controller {
    async (req,res) {
        const { id } = req.params
        for (let produto of produtos){
            if (produto.id == id){
                return res.status(202).json([produto])
            }
        }
        const response = {
            status: 404,
            mensagem: 'Not-Found'
        }
        return res.status(404).json(response)
    }
}