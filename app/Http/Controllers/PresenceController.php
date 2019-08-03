<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\Attendance;
use App\AttendanceData;
use App\ViewStudent;

class PresenceController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('teacher');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $date = date("Y-m-d");
        $attendanceData = AttendanceData::where('created_at', 'like', '%'.$date.'%');
        $count = $attendanceData->count();

        $status = Attendance::where('created_at', 'like', '%'.$date.'%')->count();
        return view('attendance-data/index')
        ->withCountsToday($count)
        ->withAttendances($attendanceData->paginate(20))
        ->withAvailable($status);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $student = ViewStudent::all();
        return view('attendance-data/create')
        ->withStudents($student);
    }

    /**
     * Show the form for creating a new qr data.
     *
     * @return \Illuminate\Http\Response
     */
    public function createQr()
    {
        return view('attendance-data/generate');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'id_students' => 'required',
            'status' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $date = date("Y-m-d");

        $attendanceData = new AttendanceData;
        $attendanceData->id_students = $request->post('id_students');
        $attendanceData->id_attendance = Attendance::select('id')->where('created_at', 'like', '%'.$date.'%')->first()->id;
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/presence');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $student = ViewStudent::all();
        $data = AttendanceData::find($id);
        return view('attendance-data/update')
        ->withData($data)
        ->withStudents($student);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'id_students' => 'required',
            'status' => 'required',
        ]);

        $date = date("Y-m-d");

        $attendanceData = AttendanceData::find($id);
        $attendanceData->id_students = $request->post('id_students');
        $attendanceData->id_attendance = Attendance::select('id')->where('created_at', 'like', '%'.$date.'%')->first()->id;
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        return redirect('dashboard/presence');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $attendanceData = AttendanceData::find($id);
        $attendanceData->delete();
        return Response::json($attendanceData);
    }
}
