import bandwidthd



def main(IpList, sensor_name):
	
	print IpList
	return "Done"
	print sensor_name
	for Counter in IpList:
		res=bandwidthd.get_entry(Counter)
		res['mac']='nope'
	return "Done"
