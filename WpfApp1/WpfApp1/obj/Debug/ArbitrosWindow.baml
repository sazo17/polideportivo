   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.ArbitrosWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  arbitros��5   	   $	��600��5      $	��800��6'    � WindowStartupLocation$ CenterScreen=�63    � WindowStyle$
 None=�6X    � 
ResizeMode$ CanMinimize=�6k   ��5      �� 5	   
    �� ImageSource$: 4polideportivo_images/arbitro/arbitro-background1.jpg��6   .��5      � -   5         �Name$ grid_arbitros��5       J� RenderTransformOrigin$ 0.5,0.5&�6"   $��0,0.003,-1.497,-0.003q�6B   $
��Left=�6a   $��801.497��6|   z�5   
   V� 5      .~�5      �� �� 5      �� 5       �� Angle$ 0.184Q�6"   T� 5      5      .+�5   
   A� -   5         A�Name$ ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   	 � Cursor$
	 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
	 Hand��6�   �� 5   
   -   5        
 ��Name$
 
btn_cerrar��5      $�� ��6%   $��10,10,768,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $
 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5    
   -   5         ��Name$ lbl_arbitros��5       $��	Árbitros��6&   $
��Left=�69   $��
280,21,0,0q�6T   $	��Top=�6h   $��65��6�   $	��207��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   &   System.Windows.Controls.DataGrid  5!   
   -   5          Name$ dg_arbitros��5!      $
��Left=�6(   $	��383��6C   $��
10,155,0,0q�6P   $	��Top=�6d   $��781.497��6|    J� Opacity$	 0.7Q�6�      
IsReadOnly . 6�   �� 5"   
   -	   5        $
 btn_regresar��5"      $��Regresar��6'   $
��Left=�6:   $��
48,552,0,0q�6U   $	��Top=�6i   $	��692��6�   6�   �� 5#   
   -
   5        $
 btn_agregar_arbitro��5#      $��Agregar árbitro��6.   $
��Left=�6H   $��
45,120,0,0q�6c   $	��Top=�6w   $	��108��6�   6�   �� 5$   
   -   5        $
 btn_modificar_arbitro��5$      $��Modificar árbitro��60   $
��Left=�6L   $��158,120,0,0q�6g   $	��Top=�6|   $	��108��6�   6�   �� 5%   
   -   5        $
 btn_eliminar_arbitro��5%      $��Eliminar árbitro��6/   $
��Left=�6J   $��271,120,0,0q�6e   $	��Top=�6z   $	��108��6�   6�   5'      5(      