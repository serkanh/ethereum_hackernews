pragma solidity ^0.4.11;
// We have to specify what version of compiler this code will compile with

contract Links {

  function bytes32ToString (bytes32 data) returns (string) {
    bytes memory bytesString = new bytes(32);
    for (uint j=0; j<32; j++) {
        byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[j] = char;
        }
    }
    return string(bytesString);
}  

  // Create a News struct
  struct Link {
    string title;
    string link;
  }
  


  //mapping
  mapping(bytes32 => uint8) public votesReceived;

  bytes32[] public linkList;

  //constructor method name should match the contract
  function Links(bytes32[] linksObject) public {
    linkList = linksObject;
  }
    // for (uint i = 0; i < _linkObjectsData.length; i++) {
    //         linkList.push(Link(bytes32ToString(_linkObjectsData[i].title),bytes32ToString(_linkObjectsData[i].link)));
    //     }

  function totalVotesFor(bytes32 _link) returns (uint8) {
    return votesReceived[_link];
  }

  function voteForLink(bytes32 _link) {
    votesReceived[_link] += 1;
  }
  
}
