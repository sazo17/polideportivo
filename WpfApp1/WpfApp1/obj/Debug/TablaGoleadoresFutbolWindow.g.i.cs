﻿#pragma checksum "..\..\TablaGoleadoresFutbolWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "09DFCB951FBFF0596D73BF78092FB40E58A4F41B"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using WpfApp1;


namespace WpfApp1 {
    
    
    /// <summary>
    /// TablaGoleadoresFutbolWindow
    /// </summary>
    public partial class TablaGoleadoresFutbolWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 1 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal WpfApp1.TablaGoleadoresFutbolWindow goleadores;
        
        #line default
        #line hidden
        
        
        #line 9 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid lbl_goleadores1;
        
        #line default
        #line hidden
        
        
        #line 10 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Ellipse ellipse_cerrar;
        
        #line default
        #line hidden
        
        
        #line 11 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Ellipse ellipse_maximizar;
        
        #line default
        #line hidden
        
        
        #line 12 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_cerrar;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_minimizar;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbl_goleadores;
        
        #line default
        #line hidden
        
        
        #line 23 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dg_goleadores;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\TablaGoleadoresFutbolWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_regresar;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/WpfApp1;component/tablagoleadoresfutbolwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\TablaGoleadoresFutbolWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.goleadores = ((WpfApp1.TablaGoleadoresFutbolWindow)(target));
            return;
            case 2:
            this.lbl_goleadores1 = ((System.Windows.Controls.Grid)(target));
            return;
            case 3:
            this.ellipse_cerrar = ((System.Windows.Shapes.Ellipse)(target));
            return;
            case 4:
            this.ellipse_maximizar = ((System.Windows.Shapes.Ellipse)(target));
            return;
            case 5:
            this.btn_cerrar = ((System.Windows.Controls.Button)(target));
            
            #line 12 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_cerrar.Click += new System.Windows.RoutedEventHandler(this.btn_cerrar_Click);
            
            #line default
            #line hidden
            
            #line 12 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_cerrar.MouseEnter += new System.Windows.Input.MouseEventHandler(this.btn_cerrar_MouseEnter);
            
            #line default
            #line hidden
            
            #line 12 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_cerrar.MouseLeave += new System.Windows.Input.MouseEventHandler(this.btn_cerrar_MouseLeave);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btn_minimizar = ((System.Windows.Controls.Button)(target));
            
            #line 17 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_minimizar.Click += new System.Windows.RoutedEventHandler(this.btn_minimizar_Click);
            
            #line default
            #line hidden
            
            #line 17 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_minimizar.MouseEnter += new System.Windows.Input.MouseEventHandler(this.btn_minimizar_MouseEnter);
            
            #line default
            #line hidden
            
            #line 17 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_minimizar.MouseLeave += new System.Windows.Input.MouseEventHandler(this.btn_minimizar_MouseLeave);
            
            #line default
            #line hidden
            return;
            case 7:
            this.lbl_goleadores = ((System.Windows.Controls.Label)(target));
            return;
            case 8:
            this.dg_goleadores = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 9:
            this.btn_regresar = ((System.Windows.Controls.Button)(target));
            
            #line 24 "..\..\TablaGoleadoresFutbolWindow.xaml"
            this.btn_regresar.Click += new System.Windows.RoutedEventHandler(this.btn_regresar_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

