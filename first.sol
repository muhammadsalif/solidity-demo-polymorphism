// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Vehicle {
    function doService() public virtual returns(string memory){
        return "Do service in Vehicle";
    }
}

contract Car is Vehicle {
    function doService() public virtual override returns(string memory){
        return "Do service in Car";
    }    
}

contract Bus is Vehicle {
    function doService() public virtual override returns(string memory){
        return "Do service in Bus";
    }   
}

contract Truck is Vehicle {
    function doService() public pure override returns(string memory){
        return "Do service in Truck";
    }   
}

contract WorkShop {
    function provideService(Vehicle vh) public returns(string memory){
        return vh.doService();
    }
}

contract DoSomething {
    event logString(string);
    function doSomething() public returns(string memory){
       Vehicle vh = new Truck();
       WorkShop ws = new WorkShop();
       emit logString(ws.provideService(vh)); // output: Do service in Truck
    }
}