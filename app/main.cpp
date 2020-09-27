import Logger;

// Required for the template to work
import <iostream>;

int main(int argc, char* argv[])
{
    lib1::Logger logger;
    logger.log("hello world:", 1, 2, "Another arg:", 3.1);
}