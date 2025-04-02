// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 5304
// Hash 5410
// Hash 4657
// Hash 7117
// Hash 9130
// Hash 9444
// Hash 3036
// Hash 1206
// Hash 7486
// Hash 9185
// Hash 7262
// Hash 5726
// Hash 7213
// Hash 3268
// Hash 2377
// Hash 9653
// Hash 9426
// Hash 1073
// Hash 4154
// Hash 6321
// Hash 5092
// Hash 2137
// Hash 8899
// Hash 6655
// Hash 4256
// Hash 5525
// Hash 7110
// Hash 3426
// Hash 6201
// Hash 6980
// Hash 1053
// Hash 3271
// Hash 4966
// Hash 5105
// Hash 9938
// Hash 6185
// Hash 8904
// Hash 3633
// Hash 3338
// Hash 3636
// Hash 5012
// Hash 4975
// Hash 4212
// Hash 3550
// Hash 9188
// Hash 5663
// Hash 9163
// Hash 6577
// Hash 5945
// Hash 1199
// Hash 9088
// Hash 4826
// Hash 6645
// Hash 7339
// Hash 1800
// Hash 4874
// Hash 1706
// Hash 8096
// Hash 7331
// Hash 8286
// Hash 5119
// Hash 8189
// Hash 1206
// Hash 1885
// Hash 9422
// Hash 6627
// Hash 5413
// Hash 1657
// Hash 8738
// Hash 7121
// Hash 1609
// Hash 5105
// Hash 6986
// Hash 8989
// Hash 7116
// Hash 7221
// Hash 2942
// Hash 7341
// Hash 2956
// Hash 1657
// Hash 6374
// Hash 7885
// Hash 8533
// Hash 7005
// Hash 9182
// Hash 9067
// Hash 2136
// Hash 1322
// Hash 6096
// Hash 5383
// Hash 1778
// Hash 5573
// Hash 2135
// Hash 4845
// Hash 7711