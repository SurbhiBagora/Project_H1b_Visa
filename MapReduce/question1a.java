import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class question1a {
	public static void main(String args[]) throws Exception
	{
	Configuration conf= new Configuration();
	Job job= Job.getInstance(conf,"question 1a");
	job.setJarByClass(question1a.class);
	job.setMapperClass(Mapper1a.class);
	job.setReducerClass(Reducer1a.class);
		
	job.setMapOutputKeyClass(Text.class);
	job.setMapOutputValueClass(LongWritable.class);

	job.setOutputKeyClass(Text.class);
	job.setOutputValueClass(LongWritable.class);

	FileInputFormat.addInputPath(job,new Path(args[0]));
	FileOutputFormat.setOutputPath(job, new Path(args[1]));

	System.exit(job.waitForCompletion(true)?1:0);

	}
}