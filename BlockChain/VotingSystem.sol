//SPDX-License-Identifier:MIT
pragma solidity^0.8.0;

//by MaghimalakshmiA

contract VotingSystem {
    //Array to store candidate names
    string[5] public candidates;

    //Mapping to store the number of votes for each candidate
    mapping(string => uint256) private candidateVotes;
     
    //Event to notify when a vote is cast
    event VoteCast(string candidate,uint256 newVoteCount);

     //constructor to initialize candidate names
     constructor(){
        candidates[0] = "John";
        candidates[1] = "Gunjan";
        candidates[2] = "mahima";
        candidates[3] = "vaishu";
        candidates[4] = "maghima";
     }

     //function to cast a vote for a candidate
     function vote (uint8 candidateIndex) public{
        require(candidateIndex < 5, "Invalid candidate Index");

        string memory selectedCandidate = candidates[candidateIndex];
        candidateVotes[selectedCandidate]++;
        emit VoteCast(selectedCandidate,candidateVotes[selectedCandidate]);
     }
     //function to get the current vote count for a candidate
     function getVotes(string memory candidate) public view returns(uint256){
        return candidateVotes[candidate];
     } 

     //function to get all candidates names
     function getCandidateNames() public view returns(string[5]memory){
        return candidates;
     }

}