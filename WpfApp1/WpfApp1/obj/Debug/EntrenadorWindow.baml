   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.EntrenadorWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  
entrenador��5   	    � Title$ EntrenadorWindow��5   	   $	��600��6"   $	��800��6/    � WindowStartupLocation$ CenterScreen=�6;    � 
ResizeMode$ CanMinimize=�6`    � WindowStyle$
 None=�6y   ��5	      �� 5
   
    �� ImageSource$: 4polideportivo_images/coach/entrenador-background.jpg��6   .��5      � -   5         �Name$ grid_entrenador��5      .+�5   
   A� -   5         A�Name$ ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�    J� RenderTransformOrigin$ 
1.01,1.058&�6�   	 � Cursor$
	 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
	 Hand��6�   �� 5   
   -   5        
 ��Name$
 
btn_cerrar��5      $�� ��6%   $��10,10,776,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $
 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5         ��Name$ lbl_entrenadores��5      $��Entrenadores��6*   $
��Left=�6A   $��
271,21,0,0q�6\   $	��Top=�6p   $��65��6�   $	��257��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ dg_entrenadores��5      $
��Left=�6,   $	��383��6G   $��
48,155,0,0q�6T   $	��Top=�6h   $	��692��6�    J� Opacity$	 0.7Q�6�   6�   �� 5   
   -	   5        $
 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��
48,552,0,0q�6U   $	��Top=�6i   $	��692��6�   6�   �� 5   
   -
   5        $
 btn_agregar_entrenador��5      $��Agregar entrenador��61   $
��Left=�6N   $��
45,120,0,0q�6i   $	��Top=�6}   $	��108��6�   6�   �� 5   
   -   5        $
 btn_modificar_entrenador��5      $��Modificar entrenador��63   $
��Left=�6R   $��158,120,0,0q�6m   $	��Top=�6�   $	��108��6�   6�   �� 5   
   -   5        $
 btn_eliminar_entrenador��5      $��Eliminar entrenador��62   $
��Left=�6P   $��271,120,0,0q�6k   $	��Top=�6�   $	��108��6�   5       5!      