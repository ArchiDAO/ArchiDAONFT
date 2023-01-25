import bpy
from web3 import Web3

class NFTOperations:
    def __init__(self):
        # Connect to a local Ethereum node
        self.w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))
        # The address of the deployed contract
        self.contract_address = "0x1234567890123456789012345678901234567890"
        # The ABI (Application Binary Interface) of the contract
        self.contract_abi = [...]
        # Create a contract object
        self.contract = self.w3.eth.contract(address=self.contract_address, abi=self.contract_abi)
        # Your Ethereum address
        self.my_address = self.w3.eth.accounts[0]

    def add_address_to_whitelist(self, address):
        tx_hash = self.contract.functions.addToWhitelist(address).transact({"from": self.my_address})
        self.w3.eth.waitForTransactionReceipt(tx_hash)
        print("Address added to whitelist")

    def mint_token(self, to, token_id, name, description, image):
        tx_hash = self.contract.functions.mint(to, token_id, name, description, image).transact({"from": self.my_address})
        self.w3.eth.waitForTransactionReceipt(tx_hash)
        print("Token minted")

    def get_token_properties(self, token_id):
        return self.contract.functions.getTokenProperties(token_id).call()

class NFTGeometryNode(bpy.types.Node):
    bl_idname = "NFTGeometryNode"
    bl_label = "NFT Geometry Node"

    def update_token_properties(self, context):
        nft_ops = NFTOperations()
        token_id = self.token_id
        name, description, image = nft_ops.get_token_properties(token_id)
        self.token_name = name
        self.token_description = description
        # Do something with the image here, depending on what you want to do with it in your node

    token_id: bpy.props.IntProperty(name="Token ID", update=update_token_properties)
    token_name: bpy.props.StringProperty(name="Token Name")
    token_description: bpy.props.StringProperty(name="Token Description")
    # You can add more properties here, depending on what you want to do with the token in your node

class NFTGeometryNodeOperator(bpy.types.Operator):
    bl_idname = "nft.mint_token"
    bl_label = "Mint Token"

    def execute(self, context):
        nft_ops = NFTOperations()
        to = context.active_object.location
        token_id = context.active_object.nft_geometry_node.token_id
        name = context.active_object