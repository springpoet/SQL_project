﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace MyPCRoom
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //form3 _ 회원등록
            
            if(textBox1.Text == "")
                MessageBox.Show("id를 입력하세요");
            else if (textBox2.Text == "")
                MessageBox.Show("이름 입력하세요");
            else
                DBHelper.userAddQuery(textBox1.Text, textBox2.Text);
        }



    }
}
