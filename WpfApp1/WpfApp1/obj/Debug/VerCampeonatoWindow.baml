   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   !    WpfApp1.VerCampeonatoWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  
campeonato��5   	    � Title$ VerCampeonatoWindow��5   	   $	��600��6%   $	��800��62   ���	#FF343434 � 
ResizeMode$ CanMinimize=�6U    � WindowStyle$
 None=�6n    � WindowStartupLocation$ CenterScreen=�6�   .��5	      � -   5         �Name$ grid_campeonato��5	      .+�5
   
   A� -   5         A�Name$ ellipse_cerrar1��5
      ���	#FFE62310$
��Left=�6<   $��14��6W   $��	10,10,0,0q�6c   
���   �$	��Top=�6�   $��14��6�    J� RenderTransformOrigin$ 
1.01,1.058&�6�    � Cursor$
 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar1��5      ���	#FF3FB911$
��Left=�6?   $��14��6Z   $��	29,10,0,0q�6f   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   �� 5   
   -   5        	 ��Name$	 
btn_cerrar��5      $�� ��6%   $��10,10,776,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�   
 J� IsHitTestVisible
 . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6  
 . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5        $	 btn_jornadas��5      $��Jornadas��6'   $
��Left=�6:   $��
52,358,0,0q�6U   $	��Top=�6i   $	��155��6�   $��82��6�   6�   �� 5   
   -   5        $	 btn_portero_menos_vencido��5      $��Portero Menos Vencido��64   $
��Left=�6T   $��234,358,0,0q�6o   $	��Top=�6�   $	��155��6�   $��82��6�   6�   �� 5   
   -	   5        $	 btn_goleadores��5      $��
Goleadores��6)   $
��Left=�6>   $��417,358,0,0q�6Y   $	��Top=�6n   $	��155��6�   $��82��6�   6�   �� 5   
   -
   5         ��Name$ lbl_nombre_del_campeonato��5      $��Nombre del Campeonato��63   $
��Left=�6S   $��	10,29,0,0q�6n   $	��Top=�6�   $��65��6�   $	��780��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5         ��Name$ rectangle_copa��5      $
��Left=�6,   $	��159��6G   $��295,135,0,0q�6T   
���   �$	��Top=�6x   $	��197��6�   $ 
0.167,0.22&�6�   ��5      �� 5       �� ImageSource$2 ,polideportivo_images/campeonatos/trofeo2.png��6   5      �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��234,460,0,0q�6U   $	��Top=�6j   $	��155��6�   $��82��6�   6�   �� 5    
   -   5        $	 btn_tabla_de_posiciones��5       $��Tabla de Posiciones��62   $
��Left=�6P   $��599,358,0,0q�6k   $	��Top=�6�   $	��155��6�   $��82��6�   6�   �� 5!   
   -   5        $	 btn_calendario��5!      $��
Calendario��6)   $
��Left=�6>   $��
52,460,0,0q�6Y   $	��Top=�6m   $	��155��6�   $��82��6�   6�   5#      5$      