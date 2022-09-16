<h1 align="center">
  <br>
  <img src="https://github.com/wjc0326/OpenD/blob/main/dist/opend_assets/logo.png" alt="opend" width="50">OpenD
  <br>
</h1>

<h4 align="center">NFT Marketplace</h4>
<h4 align="center">Mint, List and Sell Non-Fungible Tokens on ICP</h4>

## Build With

* __Frontend__: HTML, CSS, JavaScript, React, [Bootstrap](https://getbootstrap.com/)
* __Backend__: [Motoko](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/motoko/), [Internet Computer (ICP)](https://internetcomputer.org/)
* __Database & Deploy__: Internet Computer (ICP). Store data in canisters and deploy on the Internet Computer blockchain

## How To Use
### HomePage
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/homepage.png" alt="homepage" width="800">
</div>

* By clicking "OpenD" at the left top of navbar, user will be directed to the homepage.
* At the right part of navbar are "Discover", "Minter" and "My NFTs", where user can buy, mint, list and sell NFTs.

### Mint NFT
* User can mint NFT at "/minter" page. 
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/mint_nft.png" alt="mint" width="800">
</div>

* After choosing the file and naming, click the "Mint NFT" button, and a loader will show up. 
* When loading process is done, the minted message will appear and the uploaded NFT will be in the "My NFTs" list.
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/mint_nft.gif" alt="mint_process" width="800">
</div>

### Sell NFT
* User can view and sell NFTs at "/collection" page.
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/my_nft.png" alt="my_nft" width="800">
</div>

* User can sell NFT by clicking "Sell" button and typing in the price in DANI (a third party token), then click "Confirm" and the loader will show up.
* Once the NFT is sold, it will be marked "Listed" and become blurry, and can be seen on the "/discover" page, where all NFTs are listed.
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/sell_nft.gif" alt="sell_process" width="800">
</div>

### Buy NFT
* User can buy NFTs at "/discover" page.
* All NFTs are listed in this page, and user can only buy NFTs which are minted by others (only these NFTs have the "Buy" button below).
<div>
  <img src="https://github.com/wjc0326/OpenD/blob/main/readme_img/discover_page.png" alt="discover_page" width="800">
</div>

## Installation
### To Install and Run the Project
1. Install the packages
```
$ npm install
```
2. Start local dfx
```
$ dfx start --clean
```
3. Check canister ID
```
$ dfx canister id token
```
4. Deploy canisters
```
$ dfx deploy --argument='("CryptoDunks #123", principal "<YOUR NFT CANISTER ID>", (vec {137; 80; 78; 71; 13; 10; 26; 10; 0; 0; 0; 13; 73; 72; 68; 82; 0; 0; 0; 10; 0; 0; 0; 10; 8; 6; 0; 0; 0; 141; 50; 207; 189; 0; 0; 0; 1; 115; 82; 71; 66; 0; 174; 206; 28; 233; 0; 0; 0; 68; 101; 88; 73; 102; 77; 77; 0; 42; 0; 0; 0; 8; 0; 1; 135; 105; 0; 4; 0; 0; 0; 1; 0; 0; 0; 26; 0; 0; 0; 0; 0; 3; 160; 1; 0; 3; 0; 0; 0; 1; 0; 1; 0; 0; 160; 2; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 160; 3; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 0; 0; 0; 0; 59; 120; 184; 245; 0; 0; 0; 113; 73; 68; 65; 84; 24; 25; 133; 143; 203; 13; 128; 48; 12; 67; 147; 94; 97; 30; 24; 0; 198; 134; 1; 96; 30; 56; 151; 56; 212; 85; 68; 17; 88; 106; 243; 241; 235; 39; 42; 183; 114; 137; 12; 106; 73; 236; 105; 98; 227; 152; 6; 193; 42; 114; 40; 214; 126; 50; 52; 8; 74; 183; 108; 158; 159; 243; 40; 253; 186; 75; 122; 131; 64; 0; 160; 192; 168; 109; 241; 47; 244; 154; 152; 112; 237; 159; 252; 105; 64; 95; 48; 61; 12; 3; 61; 167; 244; 38; 33; 43; 148; 96; 3; 71; 8; 102; 4; 43; 140; 164; 168; 250; 23; 219; 242; 38; 84; 91; 18; 112; 63; 0; 0; 0; 0; 73; 69; 78; 68; 174; 66; 96; 130;}))'
```
5. Run NPM server
```
$ npm start
```
6. Head to localhost
http://localhost:8080/

### Creating NFT for Testing
1. Mint an NFT on the command line to get NFT into mapOfNFTs
```
$ dfx canister call opend mint '(vec {137; 80; 78; 71; 13; 10; 26; 10; 0; 0; 0; 13; 73; 72; 68; 82; 0; 0; 0; 10; 0; 0; 0; 10; 8; 6; 0; 0; 0; 141; 50; 207; 189; 0; 0; 0; 1; 115; 82; 71; 66; 0; 174; 206; 28; 233; 0; 0; 0; 68; 101; 88; 73; 102; 77; 77; 0; 42; 0; 0; 0; 8; 0; 1; 135; 105; 0; 4; 0; 0; 0; 1; 0; 0; 0; 26; 0; 0; 0; 0; 0; 3; 160; 1; 0; 3; 0; 0; 0; 1; 0; 1; 0; 0; 160; 2; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 160; 3; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 0; 0; 0; 0; 59; 120; 184; 245; 0; 0; 0; 113; 73; 68; 65; 84; 24; 25; 133; 143; 203; 13; 128; 48; 12; 67; 147; 94; 97; 30; 24; 0; 198; 134; 1; 96; 30; 56; 151; 56; 212; 85; 68; 17; 88; 106; 243; 241; 235; 39; 42; 183; 114; 137; 12; 106; 73; 236; 105; 98; 227; 152; 6; 193; 42; 114; 40; 214; 126; 50; 52; 8; 74; 183; 108; 158; 159; 243; 40; 253; 186; 75; 122; 131; 64; 0; 160; 192; 168; 109; 241; 47; 244; 154; 152; 112; 237; 159; 252; 105; 64; 95; 48; 61; 12; 3; 61; 167; 244; 38; 33; 43; 148; 96; 3; 71; 8; 102; 4; 43; 140; 164; 168; 250; 23; 219; 242; 38; 84; 91; 18; 112; 63; 0; 0; 0; 0; 73; 69; 78; 68; 174; 66; 96; 130;}, "CryptoDunks #123")'
```
2. List the item into mapOfListings
```
$ dfx canister call opend listItem '(principal "<YOUR NFT CANISTER ID>", 2)'
```
3. Get OpenD canister ID
```
$ dfx canister id opend
```
4. Transfer NFT to OpenD
```
$ dfx canister call <YOUR NFT CANISTER ID> transferOwnership '(principal "<YOUR OPEND CANISTER ID>", true)'
```
