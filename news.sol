pragma solidity ^0.4.11;
// We have to specify what version of compiler this code will compile with

contract Links {

  // Defines a new type with two fields.
  struct Voter {
      address addr;
      int amount; //can be positive or negative vote
  }

  // Create a News struct
  struct Link {
    string title;
    string link;
    uint numVotes;
    mapping (uint => Voter) voters;
  }


  
   uint numLinks;

   // 
   mapping (uint => Link) links;

  // //constructor method name should match the contract
  // function Links(bytes32[] _linksObject) public {
  //   linkList = _linksObject;
  // }

  function newLink(string _title, string _link) public returns (uint linkID) {
        linkID = numLinks++; // linkID is return variable
        // Creates new struct and saves in storage. We leave out the mapping type.
        links[linkID] = Link(_title, _link, 0);
  }

  function vote(uint _linkID) public payable {
        Link storage l = Link[_linkID];
        // Creates a new temporary memory struct, initialised with the given values
        // and copies it over to storage.
        // Note that you can also use Funder(msg.sender, msg.value) to initialise.
        l.voters[l.numVotes++] = Voter({addr: msg.sender, amount: msg.value});
        l.amount += msg.value;
  }
 


  // function totalVotesFor(bytes32 _link) returns (uint8) {
  //   return votesReceived[_link];
  // }

  // function voteForLink(bytes32 _link) {
  //   votesReceived[_link] += 1;
  // }
  
}
