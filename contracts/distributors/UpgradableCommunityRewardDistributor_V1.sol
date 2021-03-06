// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import './SafeERC20.sol';
import '../utils/UpgradableRetrieveTokensFeature.sol';

/**
 * Upgradable Contract that will be used in futuere for the community rewards
 */
contract UpgradableCommunityRewardDistributor_V1 is UpgradableRetrieveTokensFeature {
    using SafeERC20 for IERC20;

    // ERC20 basic token contract being held
    IERC20 internal _token;

    /**
     * Initalize the vault
     */
    function initialize(IERC20 token_) public initializer {
        __RetrieveToken_init();
        _token = token_;
    }

    /**
     * @dev retrieve wrongly assigned tokens
     */
    function retrieveTokens(address to, address anotherToken) public override onlyOwner {
        require(address(_token) != anotherToken, 'You should only use this method to withdraw extraneous tokens.');
        super.retrieveTokens(to, anotherToken);
    }
}
