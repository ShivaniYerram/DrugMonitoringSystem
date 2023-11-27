

// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.0;

contract Supplychain{

    address owner;
   
   constructor() public {
      owner = msg.sender;
   }

uint256 drug_id=0;
uint256 employee_id=0;

struct Product{
    uint256 id;
    string name;
    string price;
    string description;
    string reqtemp;
    string manufacturing;
    uint256 timestamp;
}

struct Status{
    string location;
    uint256 timestamp;
    string environmentTemp;
    string pressure;
    string heatQ;
    uint256 warehouseId;
    uint256 drug_id;
    uint256 drugTotalQuantatity;
    bool flag;
}

struct Worker{
    string name;
    uint256 id;
    uint256 timestamp;
}

struct Data {
    uint256 environmentTemp;
    uint256 pressure;
    uint256 hindex;
    uint256 pid;
}

modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

Product[] public drugs_list;
Product private drugsInfo;
Status[] public drugStatus;
Status private statusData;
Worker[] public employees_list;
Worker private employeeInfo;
Data[] public Drug_List;
Data private DrugInfo;


mapping(uint256 => Status[]) public drug_status;
mapping (uint256 => Product) public drugs;
mapping (uint256 => Worker) public employees;
mapping (uint256 => Data[]) public data;

// add employes at corresponding warehouse
function setEmployee(string memory name) public  payable
{
    employeeInfo=Worker(name,employee_id,block.timestamp);
    employees[employee_id]=employeeInfo;
    employees_list.push(employeeInfo);
    employee_id++;

}
// adds details about a drug
function AddDrug(
    string memory name,
    string memory price,
    string memory description,
    string memory reqtemp,
    string memory manufacturing) public payable
{
    drugsInfo=Product(drug_id,name,price,description,reqtemp,manufacturing,block.timestamp);
    drugs[drug_id]=(drugsInfo);
    drugs_list.push(drugsInfo);
    drug_id++;

}
// Adds status of a drug at particular location
function AddDrugStatus( string memory location,
    
    string  memory environmentTemp,
    string  memory pressure,
    string  memory heatQ,
    uint256 wid,
    uint256 pid,
    uint256 drugTotalQuantatity,
    bool flag
) public payable {

    statusData= Status(location,block.timestamp,environmentTemp,pressure,heatQ,wid,pid,drugTotalQuantatity,flag);
    drug_status[pid].push(statusData);
    drugStatus.push(statusData);
}

//Adds drug maintaining environment conditions
function AddDrugData( uint256 environmentTemp,
    uint256 pressure,
    uint256 hindex,uint256 pid) public payable {

        DrugInfo = Data(environmentTemp,pressure,hindex,pid);
        data[pid].push(DrugInfo);
        Drug_List.push(DrugInfo);
        }
function getEmployeesList() public view returns(Worker[] memory)
{
    return employees_list;
}

function getDrugStatus(uint256 id) public view returns(Status[] memory){

    return drug_status[id];
}

function getDrugData(uint256 id) public view returns(Data[] memory){

    return data[id];
}

function getDrugs() public view returns(Product[] memory){

    return drugs_list ;
}


}
