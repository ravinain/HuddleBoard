package com.huddle.dbo;

import java.util.Map;

public interface DMLAction {
	public Map<String, Object> getData(Map<String, Object> inputData);
	public Map<String, Object> insertData(Map<String, Object> inputData);
	public Map<String, Object> deleteData(Map<String, Object> inputData);
	public Map<String, Object> updateData(Map<String, Object> inputData);
}
