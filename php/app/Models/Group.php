<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = [
        'id',
        'owner_id',
        'name',
        'description',
        'created_at',
        'is_public',
    ];
}
