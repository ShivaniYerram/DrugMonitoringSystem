# DrugMonitoringSystem
Smart Contract based Drug-Health Monitoring System for finding counterfiet drugs

Tech Stack
Blockchain --> Ethereum and Solidity
Frontend --> Reactjs and Ethers.js

How to run:
compile and Run supplychain.sol in Remix IDE and the deploy in metamask environment once it is deployed get the contract address from the deployed instance. Inorder to save Drug Status or set products, workers or other data you can use UI provided in the IDE to execute any transactions Replace the contact address in client code by following the below steps.

Client/Frontend:
Go to client folder and run npm install
Then go to componenst folder and change contract address in four files
its like const ContractAddress = '<your_contract_address>' 
now you can run the command npm start
now your app is runnng on port 3000
