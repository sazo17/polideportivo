   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.EquiposWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  
btn_equipo��5   	    � Title$ EquiposWindow��5   	   $	��600��6   $	��800��6,    � WindowStyle$
 None=�68    � 
ResizeMode$ CanMinimize=�6K    � WindowStartupLocation$ CenterScreen=�6d   ��5	      �� 5
   
    �� ImageSource$7 1polideportivo_images/campos/campos-background.jpg��6   .��5      � -   5         �Name$ grid_equipo��5       � ColumnDefinitions 5   
   �� 5      $��3* �6   �� 5      $
��357* �6   �� 5      $	��40* �6   .+�5   
   �� -   5         ��Name$ 
lbl_equipo��5      $��Equipo��6$   $��1��65   $
��Left=�6E   $��
309,49,0,0q�6`   $	��Top=�6t   $��65��6�   $	��159��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5        	 ��Name$	 btn_ver��5      $	��Ver��6"   $��1��60   $
��Left=�6@   $��156,483,0,0q�6[   $	��Top=�6p   $	��132��6�   ���	#FFEEF3EC6�   �� 5   
   -   5        $	 btn_eliminar��5      $��Eliminar��6'   $��1��6:   $
��Left=�6J   $��321,483,0,0q�6e   $	��Top=�6z   $	��132��6�   ���	#FFDBE0DA6�   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $��1��6:   $
��Left=�6J   $��481,477,0,0q�6e   $	��Top=�6z   $	��132��6�   $��32��6�   6�   A� 5   
   -   5        
 A�Name$
 ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��4,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�    J� RenderTransformOrigin$ 
1.01,1.058&�6�    � Cursor$
 Hand��6�   $��1��6�   A� 5   
   -   5        $
 ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	23,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   $��1��6�   �� 5   
   -	   5        $	 
btn_cerrar��5      $�� ��6%   $��
4,10,696,0q�60   $	��Top=�6D   $��14��6\   $��0q�6h   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6   $��1��6  ��5      �� 5      5      �� 5   
   -
   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	23,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  $��1��6�  ��5      �� 5      5!      �� 5"   
   -   5        $	 btn_agregar_equipo��5"      $��Agregar Equipo��6-   $��1��6F   $
��Left=�6V   $��321,169,0,0q�6q   $	��Top=�6�   $	��132��6�   $��30��6�   6�   &   System.Windows.Controls.DataGrid  5#   
   -   5          Name$ 
dg_equipos��5#      $
��Left=�6'   $	��186��6B   $��301,231,0,0q�6O   $	��Top=�6d   $	��167��6|    J� Opacity$	 0.7Q�6�   $��1��6�   6�   5%      5&      