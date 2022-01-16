import { utils } from "ethers";
import { Select } from "antd";
import React, { useState } from "react";
import { Address, AddressInput } from "../components";
import { useTokenList } from "eth-hooks/dapps/dex";

const { Option } = Select;

export default function Hints({ yourLocalBalance, mainnetProvider, price, address }) {
  // Get a list of tokens from a tokenlist -> see tokenlists.org!
  const [selectedToken, setSelectedToken] = useState("Pick a token!");
  const listOfTokens = useTokenList(
    "https://raw.githubusercontent.com/SetProtocol/uniswap-tokenlist/main/set.tokenlist.json",
  );

  return (
    <div>
      <div style={{ margin: 20 }}>
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          <h1>STATISTICS</h1>
        </span>
      </div>
      <div>
        <h2>NFTs minted:</h2>
        <input type="string"></input> 
      </div>
      <div>
        <h2>NFTs active:</h2>
        <input type="string"></input> 
      </div>
      <div>
        <h2>NFTs inactive:</h2>
        <input type="string"></input> 
      </div>
      <div>
        <h2>Ongoing projects:</h2>
        <input type="string"></input> 
      </div>
      <div>
        <h2>Finished projects:</h2>
        <input type="string"></input> 
      </div>
    </div>
  );
}
