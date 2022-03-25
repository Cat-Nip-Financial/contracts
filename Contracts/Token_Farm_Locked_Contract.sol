// SPDX-License-Identifier: MIT
/* 
 -[ Cat Nip Locked Farm ]-

                  @@                                    @@@@@@@@@@@              
                @..@@                            @@((((((((((((((((((@@         
               @@.@..@@                        @((((((((((((((((((((((#(@@      
               @..@@@..@@                    @((((((((((((((%@&((((((((((#(%@   
               @..@@@@...@@                @(((((((((((((((((((%@((((((((((%@   
               @...@@@.....@@@@@@@@@@@@@@@@@%(((((((((((((((((((((%@((((((#@    
               @..........................   @%(%(%%%((((((((((((#(((@#(%@@     
              @@.........................       @%(%%%(((#(((((#((((@           
              @@........................           @%((((((((#@#((((@           
              @@.......................               &@%#((((((((%@            
              @@.....................                     *@%%%(((%@            
              @@.........@@@@@......               /@@@@          @@            
              @@........@@@@@@...                  @@@@@@         @             
              @@..............                                    @             
              @@                      *@&                         @             
         @@@@@@@@                  @@*|**|@/@@@(               @@@@@@@          
     @@@#((((((((((&@@@       @@***@**(|**|(***|@%      .@@@%((((((((((%@@      
    @@((((((((((((%#%@ ..../@@@@@*(***(********@@@@@@#@%(((((((((((((((((%@@    
    @@%((((((((((@(%@             @@********@        %(@(((((((((((((((((%@     
      @@@%#((((%@(%@               @*******&@    ... /%(&((((((((((((#%@@@      
            @@@@@@@@@@@@@@@@@@@@@@  @@@@@@    @@@@@@@@@@@@@@@@@@@@@
            
 Discord: https://catnip.financial/discord
 Telegram: https://catnip.financial/telegram
 Website: https://catnip.financial
 */
pragma solidity 0.7.6;

import "./Token_Farm_Contract.sol";

contract LockedTokenFarm is TokenFarm {
    mapping(address => uint256) private _stakeTimes;

    /**
     * @dev Constructor that initializes the contract.
     */
    constructor(
        IERC20 stakeToken,
        IERC20 rewardToken,
        uint256 startTime,
        uint256 endTime,
        uint256 rewardRate
    ) TokenFarm(stakeToken, rewardToken, startTime, endTime, rewardRate) {}

    /**
     * @dev Unstakes the specified token amount from the contract.
     */
    function withdraw(uint256 amount) public override {
        require(_time() >= _endTime, "STAKE_LOCKED");

        super.withdraw(amount);
    }
}
