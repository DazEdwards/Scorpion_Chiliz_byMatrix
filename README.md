<!-- PROJECT LOGO -->
<br />
<div align="center">
    <img src="dashboard/src/assets/svg/matri_ai_logo.png" alt="Logo" width="200" height="200">
</div>
<!-- Scorpion  -->

# Scorpion

-  AI-powered sports fanzone with social networking features and NFT tokenisation
- Cross platform application with WorldCoin authentication integration
    - We used Auth0 and worldcoin to allow users to login using their WorldCoin id. Therefore there is no need for users to input and expose their private data. The Id is verified via WorldCoin.
- Tokenised multiple elements of the sports industry. Football clubs, epic sport moments, legendary figures etc. Here is the NFT deployment on the Chiliz testnet chain of our Football club tokenisation: https://testnet.chiliscan.com/token/0xb58B9Ab3c277be2B19f76E3c209D54239774887D
    - All NFT data is stored in IPFS/Filecoin via NFTStorage
- We mine sports news data from various feeds and upload then to filecoin for decentralisation and general availability.
    - These are then ingested by our RAG services and feed customised prompt-tuned OpenAI assistants with which users can interact via the application to get the latest updates about their teams/players/matches. 
