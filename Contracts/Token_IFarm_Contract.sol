// SPDX-License-Identifier: MIT
/* 
 -[ Cat Nip Token FARM ]-

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

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/Math.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC20/SafeERC20.sol";

interface IFarm {
    event Staked(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);
    event Claimed(address indexed account, uint256 reward);

    function getProgram()
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        );

    function getStakeToken() external view returns (IERC20);

    function getRewardToken() external view returns (IERC20);

    function getStake(address account) external view returns (uint256);

    function getClaimed(address account) external view returns (uint256);

    function getTotalStaked() external view returns (uint256);

    function stake(uint256 amount) external;

    function withdraw(uint256 amount) external;

    function getPendingRewards(address account) external view returns (uint256);

    function claim() external returns (uint256);
}
