require_relative './lock'

instructions = File.read('./instructions.txt')
lock = Lock.new 
lock.make_multiple_turns(instructions)
lock.print_summary()
