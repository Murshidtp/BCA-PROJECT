using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using Accord.MachineLearning;
using Accord.MachineLearning.DecisionTrees;
using Accord.MachineLearning.DecisionTrees.Learning;
using Accord.Math;
using Accord.Statistics.Analysis;
using Accord.Statistics.Filters;
using Accord.Controls;


/// <summary>
/// Summary description for knn
/// </summary>
public class knn
{
    dboprtn db = new dboprtn();
    static string answer;
	public knn()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string predict(string p1, string p2, string p3, string p4, string p5, string p6, string p7, string p8, string p9)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Dataset_tbl";
        DataTable dt = db.get(cmd);

        //Codification codebook = new Codification(ds.Tables[0], "Par1", "Par2", "Par3", "Par4", "Par5", "Par6", "Par7", "Par8", "Par9", "Par10", "Par11", "Par12", "Par13", "Par14", "Par15", "Par16", "Par17", "Par18", "Par19", "Par20", "Par21", "Res");
        Codification codebook = new Codification(dt, "p1", "p2", "p3", "p4", "p5", "p6","result");
        //DataTable symbols = codebook.Apply(ds.Tables[0]);
        DataTable symbols = codebook.Apply(dt);
        double[][] inputs = symbols.ToArray<double>("p1", "p2", "p3", "p4", "p5", "p6");

        int[] outputs = symbols.ToArray<int>("result");
        int K = 1;
        try
        {
            int[] sample = codebook.Translate(p1, p2, p3, p4, p5, p6);
            //int[] sample = new int[] { int.Parse(p1), int.Parse(p2), int.Parse(p3) };
            int classCount = 1; // 3 possible output values
            KNearestNeighbors knn = new KNearestNeighbors(k: K, classes: 2, inputs: inputs, outputs: outputs);
            double[] doubleArray = Array.ConvertAll(sample, x => (double)x);

            answer = codebook.Translate("result", knn.Compute(doubleArray));
        }
        catch
        {
            answer = "Nill";
        }
        return answer;

    }

}