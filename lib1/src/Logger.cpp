module;

import <iostream>;

export module Logger;

namespace lib1
{
export class Logger
{
public:
    template<typename T, typename ...Args>
    void log(T&& arg1, Args&& ...args) const
    {
        std::cout << arg1;
        ((std::cout << " " << args), ...);
        std::cout << std::endl;
    }
};
}


