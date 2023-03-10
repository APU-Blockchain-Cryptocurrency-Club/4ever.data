// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control functions, this simplifies the implementation of "user permissions".
*/  
contract Ownable {
    //this is the owner of the contract
    address public owner;

    //this is the pending owner of the contract
    address public pendingOwner;

    //event to be emitted when ownership is transferred
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender account.
     */
     constructor (address owner_){
        owner = owner_;
     }

    /**
        * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        require(msg.sender == owner, "error_onlyOwner");
        _;
    }

    /**
     @dev Allows the current owner to set the pendingOwner address.
     @param newOwner The address to transfer ownership to.
    */
    function transferOwnership(address newOwner) public onlyOwner {
        pendingOwner = newOwner;
    }

    /**
     @dev Allows the pendingOwner address to finalize the transfer.
    */
    function claimOwnership() public {
        require(msg.sender == pendingOwner, "error_onlyPendingOwner");
        emit OwnershipTransferred(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}