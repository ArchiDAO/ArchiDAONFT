import React from "react";
import { Link } from "react-router-dom";
import { useContractReader } from "eth-hooks";
import { ethers } from "ethers";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 */
function Home({ yourLocalBalance, readContracts }) {
  // you can also use hooks locally in your component of choice
  // in this case, let's keep track of 'purpose' variable from our contract
  const purpose = useContractReader(readContracts, "YourContract", "purpose");

  return (
    <div>
      <div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>📝</span>
        This Is Skill NFT Interface. Build your new {" "}
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          AWESOME SKILL NFT
        </span>
      </div>
      <div style={{ margin: 32 }}>
        <div>
          Name:
          <input type="string"></input> 
        </div>
        <div>
          Email: 
          <input type="string"></input>
        </div>
        <div>
          Bio: 
          <input type="string"></input>
        </div>
      </div>
      <div style={{ margin: 8 }}>
        <h2>Design skills</h2>
        <div style={{ margin: 32 }}>
          <h3>Architecture: </h3>
          <form style={{ margin: 8 }}>
            <input type="radio" id="Architecture-0" name="Architecture" value="Architecture-0" />
            <label for="Architecture-0" style={{ margin: 8 }}>0</label>
            <input type="radio" id="Architecture-1" name="Architecture" value="Architecture-1" />
            <label for="Architecture-1" style={{ margin: 8 }}>1</label>
            <input type="radio" id="Architecture-2" name="Architecture" value="Architecture-2" />
            <label for="Architecture-2" style={{ margin: 8 }}>2</label>
            <input type="radio" id="Architecture-3" name="Architecture" value="Architecture-3" />
            <label for="Architecture-3" style={{ margin: 8 }}>3</label>
            <br></br>
          </form>
          <h3>Interior: </h3>
          <form style={{ margin: 8 }}>
            <input type="radio" id="Interior-0" name="Interior" value="Interior-0" />
            <label for="Interior-0" style={{ margin: 8 }}>0</label>
            <input type="radio" id="Interior-1" name="Interior" value="Interior-1" />
            <label for="Interior-1" style={{ margin: 8 }}>1</label>
            <input type="radio" id="Interior-2" name="Interior" value="Interior-2" />
            <label for="Interior-2" style={{ margin: 8 }}>2</label>
            <input type="radio" id="Interior-3" name="Interior" value="Interior-3" />
            <label for="Interior-3" style={{ margin: 8 }}>3</label>
            <br></br>
          </form>
          
          <form style={{ margin: 8 }}>
            <label for="Urban"><h3>Urban: </h3></label>
            <input type="radio" id="Urban-0" name="Urban" value="Urban-0" />
            <label for="Urban-0" style={{ margin: 8 }}>0</label>
            <input type="radio" id="Urban-1" name="Urban" value="Urban-1" />
            <label for="Urban-1" style={{ margin: 8 }}>1</label>
            <input type="radio" id="Urban-2" name="Urban" value="Urban-2" />
            <label for="Urban-2" style={{ margin: 8 }}>2</label>
            <input type="radio" id="Urban-3" name="Urban" value="Urban-3" />
            <label for="Urban-3" style={{ margin: 8 }}>3</label>
            <br></br>
          </form>
          Please refresh this!
        </div>
      </div>
      {!purpose?<div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>👷‍♀️</span>
        You haven't deployed your contract yet, run
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          yarn chain
        </span> and <span
            className="highlight"
            style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
          >
            yarn deploy
          </span> to deploy your first contract!
      </div>:<div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>🤓</span>
        The "purpose" variable from your contract is{" "}
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          {purpose}
        </span>
      </div>}

      <div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>🤖</span>
        An example prop of your balance{" "}
        <span style={{ fontWeight: "bold", color: "green" }}>({ethers.utils.formatEther(yourLocalBalance)})</span> was
        passed into the
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          Home.jsx
        </span>{" "}
        component from
        <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          App.jsx
        </span>
      </div>
      <div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>💭</span>
        Check out the <Link to="/hints">"Hints"</Link> tab for more tips.
      </div>
      <div style={{ margin: 32 }}>
        <span style={{ marginRight: 8 }}>🛠</span>
        Tinker with your smart contract using the <Link to="/debug">"Debug Contract"</Link> tab.
      </div>
    </div>
  );
}

export default Home;
