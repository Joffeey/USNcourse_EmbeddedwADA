pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E249 : Short_Integer; pragma Import (Ada, E249, "ada__text_io_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__tags_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings__text_buffers_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__bb__timing_events_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__soft_links_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__exception_table_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__streams_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__finalization_root_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "ada__finalization_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "system__storage_pools_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__finalization_masters_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "ada__real_time_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__bb__execution_time_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__pool_global_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "system__tasking__protected_objects_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__tasking__restricted__stages_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "hal__gpio_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__i2c_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "hal__spi_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "hal__uart_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "lsm303agr_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "memory_barriers_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "cortex_m__nvic_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "nrf__events_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "nrf__gpio_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "nrf__gpio__tasks_and_events_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "nrf__interrupts_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "nrf__rtc_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "nrf__spi_master_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "nrf__tasks_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "nrf__adc_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "nrf__clock_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "nrf__ppi_E");
   E254 : Short_Integer; pragma Import (Ada, E254, "nrf__radio_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "nrf__timers_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "nrf__twi_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "nrf__uart_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "nrf__device_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "microbit__console_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "microbit__i2c_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "microbit__accelerometer_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "microbit__iosfortasking_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "microbit__radio_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "microbit__timehighspeed_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "mybrain_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "mymotordriver_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "drivingstatesfsm_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "controllerdrivingstates_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "taskact_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "taskthink_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "ultrasonic_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "wirelessradio_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "tasksense_E");

   Sec_Default_Sized_Stacks : array (1 .. 4) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 4;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Text_Io'Elab_Body;
      E249 := E249 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E005 := E005 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E059 := E059 + 1;
      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E061 := E061 + 1;
      System.Exception_Table'Elab_Body;
      E096 := E096 + 1;
      E098 := E098 + 1;
      E012 := E012 + 1;
      Ada.Streams'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Root'Elab_Spec;
      E164 := E164 + 1;
      Ada.Finalization'Elab_Spec;
      E162 := E162 + 1;
      System.Storage_Pools'Elab_Spec;
      E166 := E166 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E161 := E161 + 1;
      Ada.Real_Time'Elab_Body;
      E134 := E134 + 1;
      System.Bb.Execution_Time'Elab_Body;
      E132 := E132 + 1;
      System.Pool_Global'Elab_Spec;
      E168 := E168 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E231 := E231 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E130 := E130 + 1;
      HAL.GPIO'ELAB_SPEC;
      E159 := E159 + 1;
      HAL.I2C'ELAB_SPEC;
      E191 := E191 + 1;
      HAL.SPI'ELAB_SPEC;
      E184 := E184 + 1;
      HAL.UART'ELAB_SPEC;
      E195 := E195 + 1;
      LSM303AGR'ELAB_SPEC;
      LSM303AGR'ELAB_BODY;
      E266 := E266 + 1;
      E204 := E204 + 1;
      E202 := E202 + 1;
      E221 := E221 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E150 := E150 + 1;
      E223 := E223 + 1;
      E225 := E225 + 1;
      E179 := E179 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E182 := E182 + 1;
      E208 := E208 + 1;
      E206 := E206 + 1;
      E256 := E256 + 1;
      E227 := E227 + 1;
      E254 := E254 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E186 := E186 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E189 := E189 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E193 := E193 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E140 := E140 + 1;
      Microbit.Console'Elab_Body;
      E197 := E197 + 1;
      E270 := E270 + 1;
      Microbit.Accelerometer'Elab_Body;
      E268 := E268 + 1;
      Microbit.Iosfortasking'Elab_Spec;
      Microbit.Iosfortasking'Elab_Body;
      E199 := E199 + 1;
      Microbit.Radio'Elab_Spec;
      E251 := E251 + 1;
      Microbit.Timehighspeed'Elab_Body;
      E258 := E258 + 1;
      Mybrain'Elab_Spec;
      E260 := E260 + 1;
      Mymotordriver'Elab_Spec;
      E238 := E238 + 1;
      Drivingstatesfsm'Elab_Spec;
      E276 := E276 + 1;
      E274 := E274 + 1;
      Taskact'Elab_Spec;
      Taskact'Elab_Body;
      E123 := E123 + 1;
      Taskthink'Elab_Spec;
      Taskthink'Elab_Body;
      E272 := E272 + 1;
      E262 := E262 + 1;
      E264 := E264 + 1;
      Tasksense'Elab_Spec;
      Tasksense'Elab_Body;
      E247 := E247 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\git-repos\TBA\obj\mybrain.o
   --   C:\git-repos\TBA\obj\mymotordriver.o
   --   C:\git-repos\TBA\obj\DrivingStatesFSM.o
   --   C:\git-repos\TBA\obj\controllerdrivingstates.o
   --   C:\git-repos\TBA\obj\taskact.o
   --   C:\git-repos\TBA\obj\taskthink.o
   --   C:\git-repos\TBA\obj\ultrasonic.o
   --   C:\git-repos\TBA\obj\wirelessradio.o
   --   C:\git-repos\TBA\obj\tasksense.o
   --   C:\git-repos\TBA\obj\mycontroller.o
   --   C:\git-repos\TBA\obj\main.o
   --   -LC:\git-repos\TBA\obj\
   --   -LC:\git-repos\TBA\obj\
   --   -LC:\git-repos\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
