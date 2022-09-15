import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Listing "mo:base/Principal";
import NFTActorClass "../nft/nft";
import Principal "mo:base/Principal";

actor OpenD {

    private type Listing = {
        itemOwner: Principal;
        itemPrice: Nat;
    };

    var mapOfNFTs = HashMap.HashMap<Principal, NFTActorClass.NFT>(1, Principal.equal, Principal.hash);
    var mapOfOwners = HashMap.HashMap<Principal, List.List<Principal>>(1, Principal.equal, Principal.hash);
    var mapOfListings = HashMap.HashMap<Principal, Listing>(1, Principal.equal, Principal.hash);
    
    public shared(msg) func mint(imgData: [Nat8], name: Text) : async Principal {
        let owner : Principal = msg.caller;

        Debug.print(debug_show(Cycles.balance()));
        Cycles.add(100_500_000_000);
        let newNFT = await NFTActorClass.NFT(name, owner, imgData);
        Debug.print(debug_show(Cycles.balance()));

        let newNFTPrincipal = await newNFT.getCanisterId();

        mapOfNFTs.put(newNFTPrincipal, newNFT);
        addToOwnerMap(owner, newNFTPrincipal);

        return newNFTPrincipal;
    };

    private func addToOwnerMap(owner: Principal, nftId: Principal) {

        var ownedNFTs : List.List<Principal> = switch (mapOfOwners.get(owner)) {
            case null List.nil<Principal>();
            case (?result) result;
        };

        ownedNFTs := List.push(nftId, ownedNFTs);

        mapOfOwners.put(owner, ownedNFTs);
    };

    public query func getOwnedNFTs(user: Principal) : async [Principal] {

        var userNFTs : List.List<Principal> = switch (mapOfOwners.get(user)) {
            case null List.nil<Principal>();
            case (?result) result;
        };

        return List.toArray(userNFTs);  
    };

    public query func getListedNFTs() : async [Principal] {
        return Iter.toArray(mapOfListings.keys());
    };

    public shared(msg) func listItem(id: Principal, price: Nat) : async Text{
        let item : NFTActorClass.NFT = switch (mapOfNFTs.get(id)) {
            case null return "NFT does not exist. Please try again";
            case (?result) result;
        };

        let owner = await item.getOwner();

        // check if the user calling the function is actually the owner of the NFT
        if (Principal.equal(owner, msg.caller)) {
            let newListing: Listing = {
                itemOwner = owner;
                itemPrice = price;
            };

            mapOfListings.put(id, newListing);
            return "Success!";
        } else {
            return "Sorry, this NFT seems not belong to you. Please try again.";
        }
    };

    public query func getOpenDCanisterId() : async Principal {
        return Principal.fromActor(OpenD);
    };

    public query func isListed(id: Principal) : async Bool {
        if (mapOfListings.get(id) == null) {
            return false;
        } else {
            return true;
        }
    };

    public query func getOriginalOwner(id: Principal) : async Principal {
        var listing : Listing = switch (mapOfListings.get(id)) {
            case null return Principal.fromText("");
            case (?result) result;
        };
        return listing.itemOwner;  
    };

    public query func getListedNFTPrice(id: Principal) : async Nat {
        var listing : Listing = switch (mapOfListings.get(id)) {
            case null return 0;
            case (?result) result;
        };
        return listing.itemPrice;  
    };

    public shared(msg) func completePurchase(id: Principal, ownerId: Principal, buyerId: Principal) : async Text {
        var purchasedNFT : NFTActorClass.NFT = switch (mapOfNFTs.get(id)) {
            case null return "NFT does not exist. Please try again";
            case (?result) result;
        };

        let transferResult = await purchasedNFT.transferOwnership(buyerId);
        if (transferResult == "Success!") {
            // step 1: delete the NFT item from the mapOfListings HashMap
            mapOfListings.delete(id);

            // step 2: delete the NFT item from the mapOfOwners HashMap of the original owner
            var ownedNFTs : List.List<Principal> = switch (mapOfOwners.get(ownerId)) {
                case null List.nil<Principal>();
                case (?result) result;
            };
            ownedNFTs := List.filter(ownedNFTs, func(listItemId: Principal) : Bool {
                return listItemId != id;
            });

            // step 3: add the NFT item to the mapOfOwners HashMap of the buyer
            addToOwnerMap(buyerId, id);

            return "Success!";
        } else {
            return transferResult;
        }

        
    };


};
