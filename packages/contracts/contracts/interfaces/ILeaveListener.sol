// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import "../MemberLeaveCode.sol";

interface ILeaveListener {
    function onLeave(address leavingMember, MemberLeaveCode leaveCode) external;
}