<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreGroup;
use App\Models\Group;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $groups = Group::all();
        return response()->json(
            $groups,
            200
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreGroup $request)
    {
        $insert_group = new Group;
        $insert_group->id = Str::uuid();
        $insert_group->created_at = now();
        $insert_group->owner_id = $request->owner_id;
        $insert_group->name = $request->name;
        $insert_group->description = $request->description;
        $insert_group->is_public = $request->is_public;
        $insert_group->save();
        // $group = Group::create($insert_group->all());
        return response()->json($insert_group, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
