   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   "    WpfApp1.ModificarReglaWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  modificar_reglas��5   	    � Title$ ModificarReglaWindow��5   	   $	��339��6&   $	��793��63   ���	#FF343434 � WindowStyle$
 None=�6V    � 
ResizeMode$ CanMinimize=�6i   .��5	      � -   5         �Name$ grid_modificar_regla��5	       � ColumnDefinitions 5
   
   �� 5      $	��59* �6   �� 5      $
��233* �6   .+�5   
   A� -   5         A�Name$ ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�    J� RenderTransformOrigin$ 
1.01,1.058&�6�    � Cursor$
 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   �� 5   
   -   5        	 ��Name$	 
btn_cerrar��5      $�� ��6%   $��10,10,138,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�   
 J� IsHitTestVisible
 . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6  
 . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5         ��Name$ 
lbl_nombre��5      $��DEPORTE:��6$   $
��Left=�67   $��
48,108,0,0q�6R   $	��Top=�6f   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $��77��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -   5         ��Name$ 
txt_nombre��5      $
��Left=�6&   $��23��6A   $��128,109,0,0q�6M    �� TextWrapping$
 Wrap=�6b   $	��Top=�6v   $	��152��6�   $ 0.474,2.217&�6�   $��2��6�   �� 5   
   -	   5        $ 	lbl_regla��5      $��Regla��6#   $
��Left=�63   $��
48,139,0,0q�6N   $	��Top=�6b   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $��77��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -
   5        $	 btn_guardar_regla��5      $��Guardar Regla��6,   $
��Left=�6D   $��128,284,0,0q�6_   $	��Top=�6t   $	��152��6�   $��2��6�   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $��1��6:   $
��Left=�6J   $��123,284,0,0q�6e   $	��Top=�6z   $	��470��6�   6�   �� 5   
   -   5        $ lbl_modificar_regla��5      $��Modificar Regla��6-   $
��Left=�6G   $��	90,10,0,0q�6b   $	��Top=�6u   $��65��6�   $	��323��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   $��1��6   �� 5    
   -   5        $ label��5       $��Label��6   $
��Left=�6/   $	��Top=�6J   &   System.Windows.Controls.DataGrid  5!   
   -   5          Name$ 	txt_regla��5!      $
��Left=�6&   $	��110��6A   $��110,150,0,0q�6N   $	��Top=�6c   $	��525��6{   $��2��6�   6�   5#      5$      