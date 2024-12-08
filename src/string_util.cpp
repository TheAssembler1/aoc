#include "string_util.h"

std::vector<std::string> split_input_to_lines() {
  std::vector<std::string> lines{};

  std::string input = "";
  while(std::getline(std::cin, input)) {
    lines.push_back(input);
  } 

  return lines;
}

std::vector<std::string> split_string(std::string str, char delim) {
  std::vector<std::string> res{};
  std::string cur_string = "";

  for(auto c: str) {
    if(cur_string != "" && c == delim) {
      res.push_back(cur_string);
      cur_string = ""; 
    } else if (c == delim) {
      continue;
    } else {
      cur_string.push_back(c);
    }
  }

  if(cur_string != "") {
    res.push_back(cur_string);
  }

  return res;
}
