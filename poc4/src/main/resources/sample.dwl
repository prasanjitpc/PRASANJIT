%dw 1.0
%output application/json
//%var hra = 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number
//%var tti = payload.Salary - (payload.Investment_Funds + payload.PF + hra + payload.LIC)
//%var inv = payload.Investment_Funds + payload.PF + hra + payload.LIC

---
{
	EmpId:payload.EmpId,
	FirstName:payload.FirstName,
	LastName:payload.LastName,
	Designation:payload.Designation,
	Salary:payload.Salary,
	"Total Investment":payload.Investment_Funds + payload.PF + 40000 as :number when 0.4 * payload.Basic_Salary > 40000 as :number otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC,
	"Total tax":0 as :number when ((payload.Salary - (payload.Investment_Funds + payload.PF + 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC)) <= 500000 as :number) otherwise
				(0.2 * ((payload.Salary - (payload.Investment_Funds + payload.PF + 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC)) - 500000 as :number)) when 	((payload.Salary - (payload.Investment_Funds + payload.PF + 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC)) > 500000 as :number and (payload.Salary - (payload.Investment_Funds + payload.PF + 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC)) <= 1000000 as :number) otherwise
				(100000 + 0.3 * ((payload.Salary - (payload.Investment_Funds + payload.PF + 40000 as :number when (0.4 * (payload.Basic_Salary) > 40000 as :number) otherwise 0.4 * (payload.Basic_Salary) as :number + payload.LIC)) - 1000000 as :number))
}




//	EmpId:payload.EmpId,
//	FirstName:payload.FirstName,
//	LastName:payload.LastName,
	//Designation:payload.Designation,
	//Salary:payload.Salary,
	//"Total Investment":inv,
	//"Total tax":0 as :number when (tti <= 500000 as :number) otherwise
		//		(0.2 * (tti - 500000 as :number)) when 	(tti > 500000 as :number and tti <= 1000000 as :number) otherwise
			//	(100000 + 0.3 * (tti - 1000000 as :number))
