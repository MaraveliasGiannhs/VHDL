
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity El is
  Port (
  --inputs 
  goingUp : in STD_LOGIC; 
  goingDown : in STD_LOGIC;
  FloorSelect : in STD_LOGIC_VECTOR(3 downto 0);
  
  --outputs
  CurrentFloor : out STD_LOGIC_VECTOR(3 downto 0); --endiksh orofou
  doorState: out STD_LOGIC
   );
end El;

architecture Behavioral of El is
    type State is (Idle, MovingUp, MovingDown, OpenDoor, CloseDoor, Waiting);
    signal currentState, nextState : State;

begin


StateManager: process(goingUp,goingDown,FloorSelect,currentState,nextState)
begin
case currentState is
            when Idle =>
                currentState <= Waiting;

            when MovingUp =>
            if(doorState = '1') then  --if door is open, close it before moving up
                nextState <= MovingUp;
                currentState <= CloseDoor;
              end if;
              
              if(CurrentFloor >= "1010") then --if at floor 10 (max floor), wait for next state
              nextState <= Idle;
              currentState <= Waiting;
              end if;
              
              if(FloorSelect > CurrentFloor) then
              CurrentFloor(3 downto 0) <= CurrentFloor(3 downto 0) + "0001"; --go one floor up until the destination is reached
              nextState<=MovingUp;
              currentState <= Waiting;
              end if;
              
              if (FloorSelect = CurrentFloor) then --if destination is reached, open door
              nextState <= OpenDoor; 
              currentState <= Waiting;
              end if;
              
              
            when MovingDown =>
                if(doorState = '1') then  --if door is open, close it before moving down
                nextState <= MovingDown;
                currentState <= CloseDoor;
              end if;
              
              if(CurrentFloor <= "0000") then --if at floor 0, wait for next state
              nextState <= Idle;
              currentState <= Waiting;
              end if;
              
              if(FloorSelect < CurrentFloor) then
              CurrentFloor(3 downto 0) <= CurrentFloor(3 downto 0) - "0001"; --go one floor down until the destination is reached
              nextState<=MovingDown;
              currentState <= Waiting;
              end if;
              
              if (FloorSelect = CurrentFloor) then --if destination is reached, open door
              nextState <= OpenDoor; 
              currentState <= Waiting;
              end if;
              
              
            when OpenDoor =>
                doorState <= '1'; --open
                nextState <=Idle;
                currentState <= Waiting;
                
            when CloseDoor =>
                doorState <= '0'; --close
                nextState <=Idle;
                currentState <= Waiting;

            when Waiting =>
                currentState <= nextState; --load next state
                
            when others =>
                nextState <= Idle;
        end case;
end process;

InputManager: process(goingUp,goingDown,FloorSelect,currentState,nextState)  -- for testbench. See later
begin
if (goingUp = '1' or FloorSelect > CurrentFloor) then
nextState <= MovingUp;
currentState <= Idle;
end if;

if (goingDown = '1' or FloorSelect < CurrentFloor) then -- for testbench. See later
nextState <= MovingDown;
currentState <= Idle;
end if;
end process;

end Behavioral;
