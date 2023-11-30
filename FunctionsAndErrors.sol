// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

    contract FunctionsAndErrors {

        uint public usdcPrice = 1;
        uint public accountBalance;

        function deposit(uint amount) public {
            if(amount == 0) {
                revert("CANNOT DEPOSIT 0 AMOUNT!!!");
            }

            accountBalance += amount;
        } 

        function withdraw(uint amount) public {
            require(accountBalance >= amount, "INSUFFICIENT FUNDS");

            accountBalance -= amount;
        }

        function checkStableCoin() public view returns (bool) {
            assert(usdcPrice == 1);
            return true;
        }

        function destabilizePrice(uint _usdcPrice) public {
            usdcPrice += _usdcPrice;
        }

        function stabilizePrice() public {
            usdcPrice -= usdcPrice;
            usdcPrice += 1;
        }
    }

