{{ Form::open(array('url' => 'language', 'role' => 'form', 'class' => 'solsoForm', 'data-alert' => isset($alert) ? $alert : false )) }}
	
	<div class="col-md-6">
		<div class="form-group">
			<label for="name">{{ trans('translate.name') }}</label>
			<input type="text" name="name" class="form-control required" autocomplete="off" value="{{ Input::old('name') }}">

			<?php echo $errors->first('name', '<p class="error">:messages</p>');?>
		</div>		
	</div>
	<div class="clearfix"></div>
	
	<div class="col-md-6">
		<div class="form-group">
			<label for="short_name">{{ trans('translate.short_name') }}</label>
			<input type="text" name="short_name" class="form-control required" autocomplete="off" value="{{ Input::old('short_name') }}">

			<?php echo $errors->first('short_name', '<p class="error">:messages</p>');?>
			
			@if (Session::has('validationMessage'))
			
				<p class="error">
					{{ Session::get('validationMessage') }}
				</p>		
				{{ Session::forget('validationMessage') }}
				
			@endif				
		</div>		
	</div>
	
	<div class="form-group col-md-12">
		<button type="button" class="btn btn-success solsoSave" 
		data-message-title="{{ trans('translate.create_notification') }}" data-message-error="{{ trans('translate.validation_error_messages') }}" 
		data-message-success="{{ trans('translate.data_was_saved') }}" data-message-warning="{{ trans('translate.directory_exist') }}">
			<i class="fa fa-save"></i> {{ trans('translate.save') }}
		</button>
	</div>
	
{{ Form::close() }}
