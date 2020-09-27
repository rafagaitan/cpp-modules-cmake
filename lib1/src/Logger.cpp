module;

import <iostream>;

export module Logger;

namespace lib1
{
export class Logger
{
public:
    void log(const char* str) const;
};

void Logger::log(const char* str) const
{
    std::cout << str << std::endl;
}
}


