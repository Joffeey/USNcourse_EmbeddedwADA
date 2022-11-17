pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E061 : Short_Integer; pragma Import (Ada, E061, "ada__tags_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings__text_buffers_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__bb__timing_events_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__soft_links_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__exception_table_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__streams_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__finalization_root_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__finalization_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__storage_pools_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "system__finalization_masters_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__real_time_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__pool_global_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "system__tasking__protected_objects_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "system__tasking__restricted__stages_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "hal__gpio_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "hal__i2c_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "hal__spi_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "hal__uart_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "lsm303agr_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "memory_barriers_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "cortex_m__nvic_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "nrf__events_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "nrf__gpio_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "nrf__gpio__tasks_and_events_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "nrf__interrupts_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "nrf__rtc_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "nrf__spi_master_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "nrf__tasks_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "nrf__adc_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "nrf__clock_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "nrf__ppi_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "nrf__radio_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "nrf__timers_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "nrf__twi_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "nrf__uart_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "nrf__device_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "microbit__console_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "microbit__i2c_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "microbit__accelerometer_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "microbit__iosfortasking_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "microbit__radio_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "microbit__timehighspeed_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "mybrain_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "mymotordriver_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "drivingstatesfsm_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "controllerdrivingstates_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "taskact_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "taskthink_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "ultrasonic_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "wirelessradio_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "tasksense_E");

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
      E148 := E148 + 1;
      System.Finalization_Root'Elab_Spec;
      E155 := E155 + 1;
      Ada.Finalization'Elab_Spec;
      E153 := E153 + 1;
      System.Storage_Pools'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E152 := E152 + 1;
      Ada.Real_Time'Elab_Body;
      E125 := E125 + 1;
      System.Pool_Global'Elab_Spec;
      E159 := E159 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E222 := E222 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E229 := E229 + 1;
      HAL.GPIO'ELAB_SPEC;
      E150 := E150 + 1;
      HAL.I2C'ELAB_SPEC;
      E182 := E182 + 1;
      HAL.SPI'ELAB_SPEC;
      E175 := E175 + 1;
      HAL.UART'ELAB_SPEC;
      E186 := E186 + 1;
      LSM303AGR'ELAB_SPEC;
      LSM303AGR'ELAB_BODY;
      E253 := E253 + 1;
      E195 := E195 + 1;
      E193 := E193 + 1;
      E212 := E212 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E141 := E141 + 1;
      E214 := E214 + 1;
      E216 := E216 + 1;
      E170 := E170 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E173 := E173 + 1;
      E199 := E199 + 1;
      E197 := E197 + 1;
      E243 := E243 + 1;
      E218 := E218 + 1;
      E241 := E241 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E177 := E177 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E180 := E180 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E184 := E184 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E131 := E131 + 1;
      Microbit.Console'Elab_Body;
      E188 := E188 + 1;
      E257 := E257 + 1;
      Microbit.Accelerometer'Elab_Body;
      E255 := E255 + 1;
      Microbit.Iosfortasking'Elab_Spec;
      Microbit.Iosfortasking'Elab_Body;
      E190 := E190 + 1;
      Microbit.Radio'Elab_Spec;
      E238 := E238 + 1;
      Microbit.Timehighspeed'Elab_Body;
      E245 := E245 + 1;
      Mybrain'Elab_Spec;
      E247 := E247 + 1;
      Mymotordriver'Elab_Spec;
      E234 := E234 + 1;
      Drivingstatesfsm'Elab_Spec;
      E263 := E263 + 1;
      E261 := E261 + 1;
      Taskact'Elab_Spec;
      Taskact'Elab_Body;
      E123 := E123 + 1;
      Taskthink'Elab_Spec;
      Taskthink'Elab_Body;
      E259 := E259 + 1;
      E249 := E249 + 1;
      E251 := E251 + 1;
      Tasksense'Elab_Spec;
      Tasksense'Elab_Body;
      E236 := E236 + 1;
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
   --   C:\Ada\CarV3\obj\mybrain.o
   --   C:\Ada\CarV3\obj\mymotordriver.o
   --   C:\Ada\CarV3\obj\DrivingStatesFSM.o
   --   C:\Ada\CarV3\obj\controllerdrivingstates.o
   --   C:\Ada\CarV3\obj\taskact.o
   --   C:\Ada\CarV3\obj\taskthink.o
   --   C:\Ada\CarV3\obj\ultrasonic.o
   --   C:\Ada\CarV3\obj\WirelessRadio.o
   --   C:\Ada\CarV3\obj\tasksense.o
   --   C:\Ada\CarV3\obj\mycontroller.o
   --   C:\Ada\CarV3\obj\main.o
   --   -LC:\Ada\CarV3\obj\
   --   -LC:\Ada\CarV3\obj\
   --   -LC:\Users\Andreas\Documents\GitHub\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
