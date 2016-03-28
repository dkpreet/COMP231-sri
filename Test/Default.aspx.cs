using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;


namespace Test
{
    public partial class Default : System.Web.UI.Page
    {
        string sConnectionString = @"server=localhost;user id=root;password=comp231;database=courseregistartion;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();

            }

        }

        private void BindGridView()
        {
            DataTable dt = new DataTable();


            try
            {

                string sQuery = "SELECT Course_Code, Course_Number, Course_Name FROM courseregistartion.course";

                MySqlConnection con = new MySqlConnection(sConnectionString);
                con.Open();
                MySqlCommand cmd = new MySqlCommand(sQuery, con);
                MySqlDataReader sdr = cmd.ExecuteReader();

                dt.Load(sdr);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();


            }
            catch
            {

            }

            finally
            {
                dt.Dispose();

            }


        }

        protected void ChckedChanged(object sender, EventArgs e)
        { 
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Bindtable();

           
        }

        private void Bindtable()
        {

            DataTable dts = new DataTable();

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string CourseCode = row.Cells[1].Text;
                        string CourseNumber = row.Cells[2].Text;

                        try
                        {
                            string sQuery = "SELECT Course_Name, Section_ID, Day, S_Time, E_Time FROM section, course, timeslot WHERE section.Course_Code = course.Course_Code AND section.Course_Number = course.Course_Number AND section.Slot_ID = timeslot.Slot_ID AND course.Course_Code = '" + CourseCode + "' AND course.Course_Number = '" + CourseNumber + "'";

                            MySqlConnection con = new MySqlConnection(sConnectionString);
                            con.Open();
                            MySqlCommand cmd = new MySqlCommand(sQuery, con);
                            MySqlDataReader sdr = cmd.ExecuteReader();

                            dts.Load(sdr);
                            GridView2.DataSource = dts;
                            GridView2.DataBind();
                            con.Close();
                        }
                        catch
                        {

                        }

                        finally
                        {
                            dts.Dispose();


                        }
                    }
                }
            }
        }
    }
    }
