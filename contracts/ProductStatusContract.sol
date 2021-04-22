// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract ProductStatusContract {
    address payable public buyer;
    address payable internal seller = 0xc71fDbDE4938D7605528FD998a7a5F5420eAbB6A;

    enum State {Pending, Shipped, Delivered, Tipped}
    State public currentState;

    uint public tipData;

    event IsPending();
    event IsShipped();
    event IsDelivered();
    event IsTipped();

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Seul le client peut appeler cette fonction");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Seul le revendeur peut appeler cette fonction");
        _;
    }

    modifier inState(State _state) {
        require(
            currentState == _state,
            "Le statut actuel n'est pas valide pour appeler cette fonction."
        );
        _;
    }

    constructor() public {
        buyer = msg.sender;
        currentState = State.Pending;
    }

    function isShipped() public {
        emit IsShipped();
        currentState = State.Shipped;
    }

    function isDelivered() public {
        emit IsDelivered();
        currentState = State.Delivered;
    }

    function addTip(uint256 _value) public {
        emit IsTipped();
        tipData = _value;
        seller.transfer(tipData);
        currentState = State.Tipped;
    }
}