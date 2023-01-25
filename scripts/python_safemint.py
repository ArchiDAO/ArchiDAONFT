from web3 import Web3

# Connect to a local Ethereum node
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))

# The address of the deployed contract
contract_address = "0x1234567890123456789012345678901234567890"

# The ABI (Application Binary Interface) of the contract
contract_abi = [...]

# Create a contract object
contract = w3.eth.contract(address=contract_address, abi=contract_abi)

# Check if connected to Ethereum node
if w3.isConnected():
    print("Connected to Ethereum node")
else:
    print("Not connected to Ethereum node")
    exit()

# Your Ethereum address
my_address = w3.eth.accounts[0]

# Add an address to the whitelist
add_address = "0x9876543210987654321098765432109876543210"
tx_hash = contract.functions.addToWhitelist(add_address).transact({"from": my_address})

# Wait for the transaction to be mined
w3.eth.waitForTransactionReceipt(tx_hash)
print("Address added to whitelist")

# Mint a new token
token_id = 1
name = "My NFT"
description = "A unique token"
image = b"\x01\x02\x03"
tx_hash = contract.functions.mint(w3.eth.accounts[1], token_id, name, description, image).transact({"from": my_address})

# Wait for the transaction to be mined
w3.eth.waitForTransactionReceipt(tx_hash)
print("Token minted")

# Get token properties
token_properties = contract.functions.getTokenProperties(token_id).call()
print("Name:", token_properties[0])
print("Description:", token_properties[1])
print("Image:", token_properties[2])