import { gql, useQuery } from "@apollo/client";
import { Button, Input, Table, Typography } from "antd";
import "antd/dist/antd.css";
import GraphiQL from "graphiql";
import "graphiql/graphiql.min.css";
import fetch from "isomorphic-fetch";
import React, { useState } from "react";
import { Address } from "../components";

const highlight = {
  marginLeft: 4,
  marginRight: 8,
  /* backgroundColor: "#f9f9f9", */ padding: 4,
  borderRadius: 4,
  fontWeight: "bolder",
};

function Subgraph(props) {
  function graphQLFetcher(graphQLParams) {
    return fetch(props.subgraphUri, {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(graphQLParams),
    }).then(response => response.json());
  }

  const EXAMPLE_GRAPHQL = `
  {
    purposes(first: 25, orderBy: createdAt, orderDirection: desc) {
      id
      purpose
      createdAt
      sender {
        id
      }
    }
    senders {
      id
      address
      purposeCount
    }
  }
  `;
  const EXAMPLE_GQL = gql(EXAMPLE_GRAPHQL);
  const { loading, data } = useQuery(EXAMPLE_GQL, { pollInterval: 2500 });

  const purposeColumns = [
    {
      title: "Purpose",
      dataIndex: "purpose",
      key: "purpose",
    },
    {
      title: "Sender",
      key: "id",
      render: record => <Address value={record.sender.id} ensProvider={props.mainnetProvider} fontSize={16} />,
    },
    {
      title: "createdAt",
      key: "createdAt",
      dataIndex: "createdAt",
      render: d => new Date(d * 1000).toISOString(),
    },
  ];

  const [newPurpose, setNewPurpose] = useState("loading...");

  const deployWarning = (
    <div style={{ marginTop: 8, padding: 8 }}>Warning: 🤔 Have you deployed your subgraph yet?</div>
  );

  return (
    <div>
      <div style={{ margin: 32 }}>
      <span
          className="highlight"
          style={{ marginLeft: 4, /* backgroundColor: "#f9f9f9", */ padding: 4, borderRadius: 4, fontWeight: "bolder" }}
        >
          <h1>CREATE A NEW ArchiDAO PROJECT</h1></span>
      </div>
      <div style={{ margin: 32 }}>
        <div>
        <h2>Name:</h2>
          <input type="string"></input> 
        </div>
        <div>
        <h2>Contact person:</h2> 
          <input type="email"></input>
        </div>
        <div>
        <h2>Brief:</h2> 
          <input type="string"></input>
        </div>
        <div>
        <h2>Deadline:</h2> 
          <input type="date"></input>
        </div>
      </div>
      <div style={{ margin: 10 }}>
        <h1>Needed design skills</h1>
        <div>
          <h3>Architecture:</h3> 
          <input type="number" id="quantity" name="quantity" min="10" max="500"></input> manhours
        </div>
        <div>
          <h3>Interior:</h3> 
          <input type="number" id="quantity" name="quantity" min="10" max="500"></input> manhours
        </div>
        <div>
          <h3>Urban:</h3> 
          <input type="number" id="quantity" name="quantity" min="10" max="500"></input> manhours
        </div>
          {/*<form>
          <label for="quantity">Quantity (between 1 and 5):</label>
          <input type="number" id="quantity" name="quantity" min="1" max="5">
          </form> */}

          <hr></hr>
          <form>
            <button style={{ margin: 32 },{padding: 16},{width: 450}}><h1>Create it!</h1></button>
          </form>

      </div> 
    </div>
  );
}

export default Subgraph;
